( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b571 - block
    b817 - block
    b709 - block
    b821 - block
    b314 - block
    b243 - block
    b356 - block
    b749 - block
    b328 - block
    b162 - block
    b643 - block
    b598 - block
    b901 - block
    b415 - block
    b285 - block
    b957 - block
    b853 - block
    b822 - block
    b100 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b571 )
    ( on b817 b571 )
    ( on b709 b817 )
    ( on b821 b709 )
    ( on b314 b821 )
    ( on b243 b314 )
    ( on b356 b243 )
    ( on b749 b356 )
    ( on b328 b749 )
    ( on b162 b328 )
    ( on b643 b162 )
    ( on b598 b643 )
    ( on b901 b598 )
    ( on b415 b901 )
    ( on b285 b415 )
    ( on b957 b285 )
    ( on b853 b957 )
    ( on b822 b853 )
    ( on b100 b822 )
    ( on b208 b100 )
    ( clear b208 )
  )
  ( :tasks
    ( Make-19Pile b817 b709 b821 b314 b243 b356 b749 b328 b162 b643 b598 b901 b415 b285 b957 b853 b822 b100 b208 )
  )
)
