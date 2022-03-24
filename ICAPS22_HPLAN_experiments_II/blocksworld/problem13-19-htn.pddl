( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b518 - block
    b346 - block
    b106 - block
    b809 - block
    b324 - block
    b226 - block
    b370 - block
    b284 - block
    b920 - block
    b911 - block
    b119 - block
    b645 - block
    b827 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b518 )
    ( on b346 b518 )
    ( on b106 b346 )
    ( on b809 b106 )
    ( on b324 b809 )
    ( on b226 b324 )
    ( on b370 b226 )
    ( on b284 b370 )
    ( on b920 b284 )
    ( on b911 b920 )
    ( on b119 b911 )
    ( on b645 b119 )
    ( on b827 b645 )
    ( on b231 b827 )
    ( clear b231 )
  )
  ( :tasks
    ( Make-13Pile b346 b106 b809 b324 b226 b370 b284 b920 b911 b119 b645 b827 b231 )
  )
)
