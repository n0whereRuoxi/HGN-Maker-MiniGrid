( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b879 - block
    b140 - block
    b631 - block
    b225 - block
    b678 - block
    b756 - block
    b89 - block
    b142 - block
    b460 - block
    b115 - block
    b268 - block
    b799 - block
    b534 - block
    b359 - block
    b458 - block
    b398 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b879 b349 )
    ( on b140 b879 )
    ( on b631 b140 )
    ( on b225 b631 )
    ( on b678 b225 )
    ( on b756 b678 )
    ( on b89 b756 )
    ( on b142 b89 )
    ( on b460 b142 )
    ( on b115 b460 )
    ( on b268 b115 )
    ( on b799 b268 )
    ( on b534 b799 )
    ( on b359 b534 )
    ( on b458 b359 )
    ( on b398 b458 )
    ( on b341 b398 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b349 )
    )
  )
)
