( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b665 - block
    b464 - block
    b514 - block
    b98 - block
    b872 - block
    b581 - block
    b993 - block
    b597 - block
    b214 - block
    b182 - block
    b976 - block
    b530 - block
    b306 - block
    b99 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b665 )
    ( on b464 b665 )
    ( on b514 b464 )
    ( on b98 b514 )
    ( on b872 b98 )
    ( on b581 b872 )
    ( on b993 b581 )
    ( on b597 b993 )
    ( on b214 b597 )
    ( on b182 b214 )
    ( on b976 b182 )
    ( on b530 b976 )
    ( on b306 b530 )
    ( on b99 b306 )
    ( clear b99 )
  )
  ( :goal
    ( and
      ( clear b665 )
    )
  )
)
