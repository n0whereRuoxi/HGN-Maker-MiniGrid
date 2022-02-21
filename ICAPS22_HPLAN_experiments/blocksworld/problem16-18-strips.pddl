( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b392 - block
    b988 - block
    b47 - block
    b328 - block
    b566 - block
    b182 - block
    b238 - block
    b604 - block
    b927 - block
    b616 - block
    b887 - block
    b750 - block
    b845 - block
    b893 - block
    b843 - block
    b623 - block
    b999 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b392 )
    ( on b988 b392 )
    ( on b47 b988 )
    ( on b328 b47 )
    ( on b566 b328 )
    ( on b182 b566 )
    ( on b238 b182 )
    ( on b604 b238 )
    ( on b927 b604 )
    ( on b616 b927 )
    ( on b887 b616 )
    ( on b750 b887 )
    ( on b845 b750 )
    ( on b893 b845 )
    ( on b843 b893 )
    ( on b623 b843 )
    ( on b999 b623 )
    ( clear b999 )
  )
  ( :goal
    ( and
      ( clear b392 )
    )
  )
)
