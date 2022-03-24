( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b414 - block
    b612 - block
    b855 - block
    b10 - block
    b494 - block
    b337 - block
    b294 - block
    b741 - block
    b571 - block
    b572 - block
    b923 - block
    b243 - block
    b542 - block
    b221 - block
    b464 - block
    b536 - block
    b931 - block
    b48 - block
    b76 - block
    b625 - block
    b966 - block
    b836 - block
    b340 - block
    b371 - block
    b385 - block
    b188 - block
    b648 - block
    b971 - block
    b519 - block
    b904 - block
    b833 - block
    b72 - block
    b803 - block
    b802 - block
    b996 - block
    b853 - block
    b907 - block
    b827 - block
    b673 - block
    b684 - block
    b509 - block
    b45 - block
    b782 - block
    b449 - block
    b992 - block
    b97 - block
    b29 - block
    b454 - block
    b743 - block
    b874 - block
    b986 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b612 b414 )
    ( on b855 b612 )
    ( on b10 b855 )
    ( on b494 b10 )
    ( on b337 b494 )
    ( on b294 b337 )
    ( on b741 b294 )
    ( on b571 b741 )
    ( on b572 b571 )
    ( on b923 b572 )
    ( on b243 b923 )
    ( on b542 b243 )
    ( on b221 b542 )
    ( on b464 b221 )
    ( on b536 b464 )
    ( on b931 b536 )
    ( on b48 b931 )
    ( on b76 b48 )
    ( on b625 b76 )
    ( on b966 b625 )
    ( on b836 b966 )
    ( on b340 b836 )
    ( on b371 b340 )
    ( on b385 b371 )
    ( on b188 b385 )
    ( on b648 b188 )
    ( on b971 b648 )
    ( on b519 b971 )
    ( on b904 b519 )
    ( on b833 b904 )
    ( on b72 b833 )
    ( on b803 b72 )
    ( on b802 b803 )
    ( on b996 b802 )
    ( on b853 b996 )
    ( on b907 b853 )
    ( on b827 b907 )
    ( on b673 b827 )
    ( on b684 b673 )
    ( on b509 b684 )
    ( on b45 b509 )
    ( on b782 b45 )
    ( on b449 b782 )
    ( on b992 b449 )
    ( on b97 b992 )
    ( on b29 b97 )
    ( on b454 b29 )
    ( on b743 b454 )
    ( on b874 b743 )
    ( on b986 b874 )
    ( clear b986 )
  )
  ( :goal
    ( and
      ( clear b414 )
    )
  )
)
