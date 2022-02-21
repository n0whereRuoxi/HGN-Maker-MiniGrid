( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b534 - block
    b357 - block
    b511 - block
    b165 - block
    b458 - block
    b439 - block
    b77 - block
    b893 - block
    b391 - block
    b293 - block
    b998 - block
    b669 - block
    b928 - block
    b807 - block
    b898 - block
    b58 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b534 )
    ( on b357 b534 )
    ( on b511 b357 )
    ( on b165 b511 )
    ( on b458 b165 )
    ( on b439 b458 )
    ( on b77 b439 )
    ( on b893 b77 )
    ( on b391 b893 )
    ( on b293 b391 )
    ( on b998 b293 )
    ( on b669 b998 )
    ( on b928 b669 )
    ( on b807 b928 )
    ( on b898 b807 )
    ( on b58 b898 )
    ( clear b58 )
  )
  ( :goal
    ( and
      ( clear b534 )
    )
  )
)
