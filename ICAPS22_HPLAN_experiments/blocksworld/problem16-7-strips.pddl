( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b1 - block
    b245 - block
    b470 - block
    b162 - block
    b695 - block
    b609 - block
    b9 - block
    b171 - block
    b538 - block
    b431 - block
    b933 - block
    b156 - block
    b95 - block
    b618 - block
    b477 - block
    b205 - block
    b242 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b245 b1 )
    ( on b470 b245 )
    ( on b162 b470 )
    ( on b695 b162 )
    ( on b609 b695 )
    ( on b9 b609 )
    ( on b171 b9 )
    ( on b538 b171 )
    ( on b431 b538 )
    ( on b933 b431 )
    ( on b156 b933 )
    ( on b95 b156 )
    ( on b618 b95 )
    ( on b477 b618 )
    ( on b205 b477 )
    ( on b242 b205 )
    ( clear b242 )
  )
  ( :goal
    ( and
      ( clear b1 )
    )
  )
)
