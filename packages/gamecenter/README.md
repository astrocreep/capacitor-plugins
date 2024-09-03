# @astrocreep/capacitor-gamecenter

GameCenter for Capacitor.js
iOS only

## Install

```bash
npm install @astrocreep/capacitor-gamecenter
npx cap sync
```

## API

<docgen-index>

* [`authenticate()`](#authenticate)
* [`toggleAccessPoint(...)`](#toggleaccesspoint)
* [`addScore(...)`](#addscore)
* [`progressAchievement(...)`](#progressachievement)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### authenticate()

```typescript
authenticate() => Promise<void>
```

--------------------


### toggleAccessPoint(...)

```typescript
toggleAccessPoint(options: ToggleAccessPointOptions) => Promise<void>
```

| Param         | Type                                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| **`options`** | <code><a href="#toggleaccesspointoptions">ToggleAccessPointOptions</a></code> |

--------------------


### addScore(...)

```typescript
addScore(options: AddScoreOptions) => Promise<AddScoreResult>
```

| Param         | Type                                                        |
| ------------- | ----------------------------------------------------------- |
| **`options`** | <code><a href="#addscoreoptions">AddScoreOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#addscoreresult">AddScoreResult</a>&gt;</code>

--------------------


### progressAchievement(...)

```typescript
progressAchievement(options: ProgressAchievementOptions) => Promise<void>
```

| Param         | Type                                                                              |
| ------------- | --------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#progressachievementoptions">ProgressAchievementOptions</a></code> |

--------------------


### Interfaces


#### ToggleAccessPointOptions

| Prop       | Type                 |
| ---------- | -------------------- |
| **`show`** | <code>boolean</code> |


#### AddScoreResult

| Prop          | Type                 |
| ------------- | -------------------- |
| **`success`** | <code>boolean</code> |


#### AddScoreOptions

| Prop             | Type                |
| ---------------- | ------------------- |
| **`identifier`** | <code>string</code> |
| **`score`**      | <code>number</code> |


#### ProgressAchievementOptions

| Prop             | Type                |
| ---------------- | ------------------- |
| **`identifier`** | <code>string</code> |
| **`progress`**   | <code>number</code> |

</docgen-api>
