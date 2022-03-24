( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b230 - block
    b207 - block
    b881 - block
    b102 - block
    b461 - block
    b88 - block
    b147 - block
    b424 - block
    b231 - block
    b542 - block
    b117 - block
    b498 - block
    b928 - block
    b610 - block
    b55 - block
    b219 - block
    b26 - block
    b817 - block
    b794 - block
    b743 - block
    b28 - block
    b643 - block
    b46 - block
    b205 - block
    b321 - block
    b61 - block
    b325 - block
    b142 - block
    b875 - block
    b45 - block
    b519 - block
    b616 - block
    b495 - block
    b51 - block
    b984 - block
    b664 - block
    b369 - block
    b217 - block
    b391 - block
    b929 - block
    b300 - block
    b164 - block
    b82 - block
    b227 - block
    b740 - block
    b488 - block
    b482 - block
    b568 - block
    b136 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b230 b18 )
    ( on b207 b230 )
    ( on b881 b207 )
    ( on b102 b881 )
    ( on b461 b102 )
    ( on b88 b461 )
    ( on b147 b88 )
    ( on b424 b147 )
    ( on b231 b424 )
    ( on b542 b231 )
    ( on b117 b542 )
    ( on b498 b117 )
    ( on b928 b498 )
    ( on b610 b928 )
    ( on b55 b610 )
    ( on b219 b55 )
    ( on b26 b219 )
    ( on b817 b26 )
    ( on b794 b817 )
    ( on b743 b794 )
    ( on b28 b743 )
    ( on b643 b28 )
    ( on b46 b643 )
    ( on b205 b46 )
    ( on b321 b205 )
    ( on b61 b321 )
    ( on b325 b61 )
    ( on b142 b325 )
    ( on b875 b142 )
    ( on b45 b875 )
    ( on b519 b45 )
    ( on b616 b519 )
    ( on b495 b616 )
    ( on b51 b495 )
    ( on b984 b51 )
    ( on b664 b984 )
    ( on b369 b664 )
    ( on b217 b369 )
    ( on b391 b217 )
    ( on b929 b391 )
    ( on b300 b929 )
    ( on b164 b300 )
    ( on b82 b164 )
    ( on b227 b82 )
    ( on b740 b227 )
    ( on b488 b740 )
    ( on b482 b488 )
    ( on b568 b482 )
    ( on b136 b568 )
    ( on b366 b136 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
