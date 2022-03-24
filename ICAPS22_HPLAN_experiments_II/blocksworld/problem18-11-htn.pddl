( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b627 - block
    b341 - block
    b601 - block
    b773 - block
    b287 - block
    b393 - block
    b417 - block
    b169 - block
    b58 - block
    b123 - block
    b980 - block
    b405 - block
    b96 - block
    b288 - block
    b398 - block
    b188 - block
    b955 - block
    b514 - block
    b902 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b627 )
    ( on b341 b627 )
    ( on b601 b341 )
    ( on b773 b601 )
    ( on b287 b773 )
    ( on b393 b287 )
    ( on b417 b393 )
    ( on b169 b417 )
    ( on b58 b169 )
    ( on b123 b58 )
    ( on b980 b123 )
    ( on b405 b980 )
    ( on b96 b405 )
    ( on b288 b96 )
    ( on b398 b288 )
    ( on b188 b398 )
    ( on b955 b188 )
    ( on b514 b955 )
    ( on b902 b514 )
    ( clear b902 )
  )
  ( :tasks
    ( Make-18Pile b341 b601 b773 b287 b393 b417 b169 b58 b123 b980 b405 b96 b288 b398 b188 b955 b514 b902 )
  )
)
