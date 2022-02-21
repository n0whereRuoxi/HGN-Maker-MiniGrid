( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b998 - block
    b740 - block
    b720 - block
    b892 - block
    b175 - block
    b531 - block
    b94 - block
    b758 - block
    b536 - block
    b284 - block
    b771 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b998 b764 )
    ( on b740 b998 )
    ( on b720 b740 )
    ( on b892 b720 )
    ( on b175 b892 )
    ( on b531 b175 )
    ( on b94 b531 )
    ( on b758 b94 )
    ( on b536 b758 )
    ( on b284 b536 )
    ( on b771 b284 )
    ( on b137 b771 )
    ( clear b137 )
  )
  ( :goal
    ( and
      ( clear b764 )
    )
  )
)
