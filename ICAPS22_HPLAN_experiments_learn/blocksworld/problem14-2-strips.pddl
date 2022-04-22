( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b587 - block
    b61 - block
    b99 - block
    b848 - block
    b639 - block
    b208 - block
    b550 - block
    b342 - block
    b204 - block
    b951 - block
    b237 - block
    b115 - block
    b749 - block
    b541 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b587 b618 )
    ( on b61 b587 )
    ( on b99 b61 )
    ( on b848 b99 )
    ( on b639 b848 )
    ( on b208 b639 )
    ( on b550 b208 )
    ( on b342 b550 )
    ( on b204 b342 )
    ( on b951 b204 )
    ( on b237 b951 )
    ( on b115 b237 )
    ( on b749 b115 )
    ( on b541 b749 )
    ( clear b541 )
  )
  ( :goal
    ( and
      ( clear b618 )
    )
  )
)
