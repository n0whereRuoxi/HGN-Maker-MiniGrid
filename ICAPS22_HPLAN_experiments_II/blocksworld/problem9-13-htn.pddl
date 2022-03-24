( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b392 - block
    b653 - block
    b487 - block
    b993 - block
    b415 - block
    b331 - block
    b417 - block
    b40 - block
    b562 - block
    b380 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b392 )
    ( on b653 b392 )
    ( on b487 b653 )
    ( on b993 b487 )
    ( on b415 b993 )
    ( on b331 b415 )
    ( on b417 b331 )
    ( on b40 b417 )
    ( on b562 b40 )
    ( on b380 b562 )
    ( clear b380 )
  )
  ( :tasks
    ( Make-9Pile b653 b487 b993 b415 b331 b417 b40 b562 b380 )
  )
)
