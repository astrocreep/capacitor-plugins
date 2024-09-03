export interface ToggleAccessPointOptions {
  show: boolean;
}

export interface AddScoreOptions {
  identifier: string;
  score: number;
}

export interface AddScoreResult {
  success: boolean;
}

export interface ProgressAchievementOptions {
  identifier: string;
  progress: number;
}

export interface GameCenterPlugin {
  authenticate(): Promise<void>;
  toggleAccessPoint(
    options: ToggleAccessPointOptions,
  ): Promise<void>;
  addScore(options: AddScoreOptions): Promise<AddScoreResult>;
  progressAchievement(options: ProgressAchievementOptions): Promise<void>
}
