( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b629 - block
    b810 - block
    b944 - block
    b364 - block
    b317 - block
    b852 - block
    b848 - block
    b860 - block
    b990 - block
    b831 - block
    b678 - block
    b643 - block
    b326 - block
    b85 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b629 )
    ( on b810 b629 )
    ( on b944 b810 )
    ( on b364 b944 )
    ( on b317 b364 )
    ( on b852 b317 )
    ( on b848 b852 )
    ( on b860 b848 )
    ( on b990 b860 )
    ( on b831 b990 )
    ( on b678 b831 )
    ( on b643 b678 )
    ( on b326 b643 )
    ( on b85 b326 )
    ( clear b85 )
  )
  ( :goal
    ( and
      ( clear b629 )
    )
  )
)
