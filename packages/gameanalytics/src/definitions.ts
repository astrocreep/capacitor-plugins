export interface GAInitOptions {
  debug?: boolean;
  build: string;
  key: string;
  secret: string;
}

export interface GABusinessEventOptions {
  currency: string,
  amount: number,
  itemType: string,
  itemId: string,
  cartType: string,
  receipt: string
}

export interface GADesignEventOptions {
  id: string;
  value?: number;
  customFields?: Record<string, string | number | boolean>;
}

export interface GameAnalyticsPlugin {
  initialize(options: GAInitOptions): Promise<void>;
  addBusinessEvent(options: GABusinessEventOptions): Promise<void>;
  addDesignEvent(options: GADesignEventOptions): Promise<void>;
}
