( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b215 - block
    b559 - block
    b618 - block
    b554 - block
    b263 - block
    b214 - block
    b293 - block
    b558 - block
    b539 - block
    b721 - block
    b431 - block
    b335 - block
    b589 - block
    b839 - block
    b65 - block
    b2 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b215 b521 )
    ( on b559 b215 )
    ( on b618 b559 )
    ( on b554 b618 )
    ( on b263 b554 )
    ( on b214 b263 )
    ( on b293 b214 )
    ( on b558 b293 )
    ( on b539 b558 )
    ( on b721 b539 )
    ( on b431 b721 )
    ( on b335 b431 )
    ( on b589 b335 )
    ( on b839 b589 )
    ( on b65 b839 )
    ( on b2 b65 )
    ( on b279 b2 )
    ( clear b279 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
