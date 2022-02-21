( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b174 - block
    b289 - block
    b145 - block
    b900 - block
    b141 - block
    b812 - block
    b873 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b174 )
    ( on b289 b174 )
    ( on b145 b289 )
    ( on b900 b145 )
    ( on b141 b900 )
    ( on b812 b141 )
    ( on b873 b812 )
    ( clear b873 )
  )
  ( :goal
    ( and
      ( clear b174 )
      ( clear b174 )
      ( clear b174 )
      ( clear b174 )
      ( clear b174 )
      ( clear b174 )
      ( clear b174 )
    )
  )
)
