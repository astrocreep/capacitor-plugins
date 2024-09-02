export interface TextInteractionPlugin {
  /**
   * Toggle text interaction (selection) on the Capacitor WebView.
   *
   * ⚠️ As long as you disable text interaction, you won't be able
   * to use any input fields in the WebView. Either disable while text input is active or
   * use native text input overlays.
   *
   * @param {TextInteractionOptions} options
   * @returns {Promise<TextInteractionResult>}
   *
   * @since 1.0.0
   */

  toggle(options: TextInteractionOptions): Promise<TextInteractionResult>
}

export interface TextInteractionOptions {
  /**
   * Whether text interaction should be enabled or disabled.
   * Disabling suppresses the magnifier lens that Apple reintroduced with iOS 15.
   *
   * iOS only
   *
   * @since 1.0.0
   */
  enabled: boolean
}

export interface TextInteractionResult {
  /**
   * true if supported (>= iOS 14.5), false if not
   *
   * @since 1.0.0
   */
  success: boolean
}
