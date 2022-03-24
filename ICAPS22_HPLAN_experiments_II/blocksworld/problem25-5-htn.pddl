( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b326 - block
    b228 - block
    b866 - block
    b323 - block
    b697 - block
    b367 - block
    b435 - block
    b599 - block
    b212 - block
    b649 - block
    b27 - block
    b58 - block
    b126 - block
    b31 - block
    b537 - block
    b904 - block
    b846 - block
    b980 - block
    b593 - block
    b644 - block
    b749 - block
    b34 - block
    b90 - block
    b265 - block
    b871 - block
    b429 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b326 )
    ( on b228 b326 )
    ( on b866 b228 )
    ( on b323 b866 )
    ( on b697 b323 )
    ( on b367 b697 )
    ( on b435 b367 )
    ( on b599 b435 )
    ( on b212 b599 )
    ( on b649 b212 )
    ( on b27 b649 )
    ( on b58 b27 )
    ( on b126 b58 )
    ( on b31 b126 )
    ( on b537 b31 )
    ( on b904 b537 )
    ( on b846 b904 )
    ( on b980 b846 )
    ( on b593 b980 )
    ( on b644 b593 )
    ( on b749 b644 )
    ( on b34 b749 )
    ( on b90 b34 )
    ( on b265 b90 )
    ( on b871 b265 )
    ( on b429 b871 )
    ( clear b429 )
  )
  ( :tasks
    ( Make-25Pile b228 b866 b323 b697 b367 b435 b599 b212 b649 b27 b58 b126 b31 b537 b904 b846 b980 b593 b644 b749 b34 b90 b265 b871 b429 )
  )
)
