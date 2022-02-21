( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b611 - block
    b274 - block
    b478 - block
    b46 - block
    b568 - block
    b326 - block
    b885 - block
    b845 - block
    b660 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b611 )
    ( on b274 b611 )
    ( on b478 b274 )
    ( on b46 b478 )
    ( on b568 b46 )
    ( on b326 b568 )
    ( on b885 b326 )
    ( on b845 b885 )
    ( on b660 b845 )
    ( clear b660 )
  )
  ( :goal
    ( and
      ( clear b611 )
    )
  )
)
