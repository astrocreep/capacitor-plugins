# @astrocreep/capacitor-gameanalytics

capacitor support for gameanalytics.com

## Install

```bash
npm install @astrocreep/capacitor-gameanalytics
npx cap sync
```

## API

<docgen-index>

* [`initialize(...)`](#initialize)
* [`addBusinessEvent(...)`](#addbusinessevent)
* [`addDesignEvent(...)`](#adddesignevent)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initialize(...)

```typescript
initialize(options: GAInitOptions) => Promise<void>
```

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#gainitoptions">GAInitOptions</a></code> |

--------------------


### addBusinessEvent(...)

```typescript
addBusinessEvent(options: GABusinessEventOptions) => Promise<void>
```

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#gabusinesseventoptions">GABusinessEventOptions</a></code> |

--------------------


### addDesignEvent(...)

```typescript
addDesignEvent(options: GADesignEventOptions) => Promise<void>
```

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code><a href="#gadesigneventoptions">GADesignEventOptions</a></code> |

--------------------


### Interfaces


#### GAInitOptions

| Prop         | Type                 |
| ------------ | -------------------- |
| **`debug`**  | <code>boolean</code> |
| **`build`**  | <code>string</code>  |
| **`key`**    | <code>string</code>  |
| **`secret`** | <code>string</code>  |


#### GABusinessEventOptions

| Prop           | Type                |
| -------------- | ------------------- |
| **`currency`** | <code>string</code> |
| **`amount`**   | <code>number</code> |
| **`itemType`** | <code>string</code> |
| **`itemId`**   | <code>string</code> |
| **`cartType`** | <code>string</code> |
| **`receipt`**  | <code>string</code> |


#### GADesignEventOptions

| Prop               | Type                                                                                 |
| ------------------ | ------------------------------------------------------------------------------------ |
| **`id`**           | <code>string</code>                                                                  |
| **`value`**        | <code>number</code>                                                                  |
| **`customFields`** | <code><a href="#record">Record</a>&lt;string, string \| number \| boolean&gt;</code> |


### Type Aliases


#### Record

Construct a type with a set of properties K of type T

<code>{ [P in K]: T; }</code>

</docgen-api>
