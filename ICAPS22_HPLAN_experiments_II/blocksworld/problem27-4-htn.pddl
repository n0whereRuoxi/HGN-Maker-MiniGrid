( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b690 - block
    b393 - block
    b898 - block
    b444 - block
    b297 - block
    b263 - block
    b344 - block
    b718 - block
    b653 - block
    b421 - block
    b571 - block
    b981 - block
    b638 - block
    b540 - block
    b983 - block
    b893 - block
    b948 - block
    b338 - block
    b972 - block
    b787 - block
    b51 - block
    b230 - block
    b763 - block
    b441 - block
    b127 - block
    b954 - block
    b367 - block
    b358 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b690 )
    ( on b393 b690 )
    ( on b898 b393 )
    ( on b444 b898 )
    ( on b297 b444 )
    ( on b263 b297 )
    ( on b344 b263 )
    ( on b718 b344 )
    ( on b653 b718 )
    ( on b421 b653 )
    ( on b571 b421 )
    ( on b981 b571 )
    ( on b638 b981 )
    ( on b540 b638 )
    ( on b983 b540 )
    ( on b893 b983 )
    ( on b948 b893 )
    ( on b338 b948 )
    ( on b972 b338 )
    ( on b787 b972 )
    ( on b51 b787 )
    ( on b230 b51 )
    ( on b763 b230 )
    ( on b441 b763 )
    ( on b127 b441 )
    ( on b954 b127 )
    ( on b367 b954 )
    ( on b358 b367 )
    ( clear b358 )
  )
  ( :tasks
    ( Make-27Pile b393 b898 b444 b297 b263 b344 b718 b653 b421 b571 b981 b638 b540 b983 b893 b948 b338 b972 b787 b51 b230 b763 b441 b127 b954 b367 b358 )
  )
)
