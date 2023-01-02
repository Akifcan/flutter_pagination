import 'package:flutter/material.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:flutter_pagination/widgets/paginate_button.dart';
import 'package:flutter_pagination/widgets/skip_button.dart';

class Pagination extends StatefulWidget {
  final PaginateSkipButton prevButtonStyles;
  final PaginateSkipButton nextButtonStyles;
  final PaginateButtonStyles paginateButtonStyles;
  final bool useSkipAndPrevButtons;
  final bool useGroup;
  final int currentPage;
  final int totalPage;
  final int show;
  final double? width;
  final double? height;
  final Function(int number) onPageChange;
  const Pagination(
      {Key? key,
      this.width,
      this.height,
      this.useGroup = false,
      this.useSkipAndPrevButtons = true,
      required this.prevButtonStyles,
      required this.nextButtonStyles,
      required this.paginateButtonStyles,
      required this.onPageChange,
      required this.totalPage,
      required this.show,
      required this.currentPage})
      : super(key: key);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  late PageController pageController;
  List<int> pages = [];
  List<int> nextPages = [];
  List<int> prevPages = [];
  List<List<int>> groupedPages = [];
  double defaultHeight = 50;

  void nonGroupPaginate() {
    setState(() {
      pages = [];
      nextPages = [];
      prevPages = [];
      for (int i = 0; i < widget.totalPage; i++) {
        pages.add(i);
      }
      for (int i = 0; i < widget.show; i++) {
        if (pages.asMap().containsKey(widget.currentPage + i)) {
          nextPages.add(pages[widget.currentPage + i]);
        }
      }
      for (int i = widget.show; i > 0; i--) {
        if (widget.currentPage - i > 0) {
          prevPages.add(pages[widget.currentPage - i - 1]);
        }
      }
    });
  }

  void groupPaginate() {
    int lastIndex = 0;
    int counter = 0;
    setState(() {
      groupedPages = [];
      pages = [];
      for (int i = 0; i < widget.totalPage; i++) {
        pages.add(i);
      }
      for (int j = 0; j < pages.length; j++) {
        counter++;
        if (counter == widget.show) {
          int next = lastIndex + widget.show;
          groupedPages.add(pages.sublist(
              lastIndex, next < pages.length ? next : pages.length));
          counter = 0;
          lastIndex += widget.show;
        }
      }
      groupedPages.add(pages.sublist(lastIndex));
    });
  }

  void initialize() {
    if (!widget.useGroup) {
      nonGroupPaginate();
    } else {
      groupPaginate();
      pageController = PageController();
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.show < widget.totalPage,
        "Show count should be smaller than total page");
    initialize();
    return !widget.useGroup ? nonGrouppedChild : grouppedChild;
  }

  Widget get grouppedChild => SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: [
            if (widget.useSkipAndPrevButtons)
              SkipButton(
                buttonStyles: widget.prevButtonStyles,
                height: widget.height ?? defaultHeight,
                onTap: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                skipButtonType: SkipButtonType.prev,
              ),
            Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: groupedPages
                        .where((element) => element.isNotEmpty)
                        .length,
                    itemBuilder: (_, index) {
                      return Row(
                        children: groupedPages[index].map((e) {
                          return Expanded(
                              child: PaginateButton(
                                  active: widget.currentPage == e + 1,
                                  buttonStyles: widget.paginateButtonStyles,
                                  height: widget.height ?? defaultHeight,
                                  page: e + 1,
                                  color: e + 1 == widget.currentPage
                                      ? Colors.blueGrey
                                      : Colors.blue,
                                  onTap: (number) {
                                    widget.onPageChange(number);
                                  }));
                        }).toList(),
                      );
                    })),
            if (widget.useSkipAndPrevButtons)
              SkipButton(
                buttonStyles: widget.nextButtonStyles,
                height: widget.height ?? defaultHeight,
                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                skipButtonType: SkipButtonType.next,
              ),
          ],
        ),
      );

  Widget get nonGrouppedChild => Wrap(
        children: [
          if (widget.useSkipAndPrevButtons)
            SkipButton(
              buttonStyles: widget.prevButtonStyles,
              height: widget.height ?? defaultHeight,
              onTap: () {
                if (widget.currentPage != 1) {
                  int current = widget.currentPage;
                  widget.onPageChange(current -= 1);
                }
              },
              skipButtonType: SkipButtonType.prev,
            ),
          for (int i = 0; i < prevPages.length; i++)
            PaginateButton(
                active: false,
                width: 50,
                buttonStyles: widget.paginateButtonStyles,
                height: widget.height ?? defaultHeight,
                onTap: (number) {
                  widget.onPageChange(number);
                },
                page: prevPages[i] + 1,
                color: Colors.blue),
          PaginateButton(
              active: true,
              width: 50,
              buttonStyles: widget.paginateButtonStyles,
              height: widget.height ?? defaultHeight,
              onTap: (number) {
                widget.onPageChange(widget.currentPage);
              },
              page: widget.currentPage,
              color: Colors.blueGrey[800]!),
          for (int i = 0; i < nextPages.length; i++)
            PaginateButton(
                active: false,
                width: 50,
                buttonStyles: widget.paginateButtonStyles,
                height: widget.height ?? defaultHeight,
                onTap: (number) {
                  widget.onPageChange(number);
                },
                page: nextPages[i] + 1,
                color: Colors.blue),
          if (widget.useSkipAndPrevButtons)
            SkipButton(
              buttonStyles: widget.nextButtonStyles,
              height: widget.height ?? defaultHeight,
              onTap: () {
                if (widget.currentPage + 1 <= widget.totalPage) {
                  int current = widget.currentPage;
                  widget.onPageChange(current += 1);
                }
              },
              skipButtonType: SkipButtonType.next,
            ),
        ],
      );
}
