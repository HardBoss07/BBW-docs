
# Flexbox Cheatsheet

## What is Flexbox?
Flexbox is used to style content in either rows or columns (not both at the same time)

Init Flexbox with: 

```css
.container {
    display: flex;
}
```
**Note: everything marked with * is the default option.**

## Flex Direction
You can define Flex directions.
Flexbox has 2 axes: main axis and cross axis.
To order content using the different axes use this:
- Left -> Right: `flex-direction: row;`
- Right -> Left: `flex-direction: row-reverse;`
- Top -> Bottom: `flex-direction: column;`
- Bottom -> Top: `flex-direction: column-reverse;`

| `flex-direction` | Main Axis  | Cross Axis |
|------------------|------------|------------|
| `row`*           | Horizontal | Vertical   |
| `column`         | Vertical   | Horizontal |

## Justify-Content

Aligns content on the **main axis**.
Distributes space between items on the **main axis**.

| Value           | Description                                    |
| --------------- | ---------------------------------------------- |
| `flex-start`    | Items start at the beginning of the main axis* |
| `flex-end`      | Items align to the end of the main axis        |
| `center`        | Content is centered along the main axis        |
| `space-between` | Equal space between content                    |
| `space-around`  | Equal space around content                     |
| `space-evenly`  | Equal space between and around content         |

Example usage:
```css
.container {
    display: flex;
    justify-content: space-between;
}
```

## Align-Items

Aligns items across the **cross axis**.
Used for vertical alignment of a single line if the main axis is horizontal.

| Value        | Description                            |
| ------------ | -------------------------------------- |
| `stretch`    | Items stretch to fill container*       |
| `flex-start` | Items align to the top (cross-start)   |
| `flex-end`   | Items align to the bottom (cross-end)  |
| `center`     | Items are centered vertically          |
| `baseline`   | Items align along their text baselines |

Example usage:
```css
.container {
    display: flex;
    align-items: flex-end;
}
```

## Flex Wrap
Flexbox tries keeping content on one line. Flex wrap wraps content onto new lines if needed.

| Value          | Description                           |
| -------------- | ------------------------------------- |
| `nowrap`       | All items stay on one line*           |
| `wrap`         | Items wrap to the next line if needed |
| `wrap-reverse` | Like `wrap`, but in reverse order     |

Example usage:
```css
.container {
    display: flex;
    flex-wrap: wrap;
}
```

## Align-Content
Is used to align content if Flex wrap makes multiple lines.
Controls space **between lines**, not on individual items.

| Value           | Description                         |
| --------------- | ----------------------------------- |
| `flex-start`    | Lines packed to the top             |
| `flex-end`      | Lines packed to the bottom          |
| `center`        | Lines centered                      |
| `space-between` | Space between rows                  |
| `space-around`  | Space around rows                   |
| `space-evenly`  | Even spacing of rows                |
| `stretch`       | Rows stretch to fill the container* |

```css
.container {
  display: flex;
  flex-wrap: wrap;
  align-content: space-between;
}
```

## Summary

| Property          | Affects        | Axis  | When to Use                               |
| ----------------- | -------------- | ----- | ----------------------------------------- |
| `justify-content` | Item alignment | Main  | Align items horizontally*                 |
| `align-items`     | Item alignment | Cross | Align items vertically*                   |
| `flex-wrap`       | Item wrapping  | None  | Allow items to wrap to new lines          |
| `align-content`   | Line alignment | Cross | Align **multiple lines** (only with wrap) |
