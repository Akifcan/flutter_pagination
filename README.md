# Flutter Pagination Buttons

## Use Pagination In Flutter

### Example

- Without Group

![nongroup](https://i.hizliresim.com/7h67hlp.gif)

```
int currentPage = 1;
Pagination(
            paginateButtonStyles: PaginateButtonStyles(),
            prevButtonStyles: PaginateSkipButton(),
            nextButtonStyles: PaginateSkipButton(),
            onPageChange: (number) {
              setState(() {
                currentPage = number;
              });
            },
            totalPage: 30,
            show: 3,
            currentPage: currentPage,
    ),
```

### Example 2

- With Group

![group](https://i.hizliresim.com/aay9j7m.gif)

```
Pagination(
            width: MediaQuery.of(context).size.width * .7,
            paginateButtonStyles: PaginateButtonStyles(),
            prevButtonStyles: PaginateSkipButton(),
            nextButtonStyles: PaginateSkipButton(),
            onPageChange: (number) {
              setState(() {
                currentPage = number;
              });
            },
            useGroup: true,
            totalPage: 100,
            show: 4,
            currentPage: currentPage,
    ),
```

### **Note: If show value greater than totalPage It will throw error.**
### **Note2: Height value default:50. And works with only groupped pagination.**

### -- Styling

![stylingimage](https://i.hizliresim.com/4mkcuv7.PNG)

```
          Pagination(
            width: MediaQuery.of(context).size.width * .7,
            paginateButtonStyles: PaginateButtonStyles(
                backgroundColor: Colors.pink,
                activeBackgroundColor: Colors.amber,
                activeTextStyle: const TextStyle(color: Colors.red)),
            prevButtonStyles: PaginateSkipButton(
                icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            )),
            nextButtonStyles: PaginateSkipButton(
                icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            )),
            onPageChange: (number) {
              setState(() {
                currentPage = number;
              });
            },
            useGroup: true,
            totalPage: 100,
            show: 4,
            currentPage: currentPage,
          ),

```

| Required Fields     | Type                 |
|----------------------|----------------------|
| totalPage            | integer              |
| currentPage          | integer              |
| onPageChange         | (number) => void     |
| nextButtonStyles     | PaginateSkipButton   |
| prevButtonStyles     | PaginateSkipButton   |
| paginateButtonStyles | PaginateButtonStyles |