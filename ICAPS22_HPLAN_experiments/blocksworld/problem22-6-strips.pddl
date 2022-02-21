( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b269 - block
    b865 - block
    b806 - block
    b868 - block
    b870 - block
    b60 - block
    b177 - block
    b458 - block
    b985 - block
    b469 - block
    b327 - block
    b840 - block
    b506 - block
    b884 - block
    b324 - block
    b381 - block
    b994 - block
    b810 - block
    b303 - block
    b62 - block
    b78 - block
    b514 - block
    b536 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b269 )
    ( on b865 b269 )
    ( on b806 b865 )
    ( on b868 b806 )
    ( on b870 b868 )
    ( on b60 b870 )
    ( on b177 b60 )
    ( on b458 b177 )
    ( on b985 b458 )
    ( on b469 b985 )
    ( on b327 b469 )
    ( on b840 b327 )
    ( on b506 b840 )
    ( on b884 b506 )
    ( on b324 b884 )
    ( on b381 b324 )
    ( on b994 b381 )
    ( on b810 b994 )
    ( on b303 b810 )
    ( on b62 b303 )
    ( on b78 b62 )
    ( on b514 b78 )
    ( on b536 b514 )
    ( clear b536 )
  )
  ( :goal
    ( and
      ( clear b269 )
    )
  )
)
