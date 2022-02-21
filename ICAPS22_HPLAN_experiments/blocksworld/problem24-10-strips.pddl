( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b9 - block
    b661 - block
    b48 - block
    b771 - block
    b349 - block
    b204 - block
    b431 - block
    b834 - block
    b44 - block
    b836 - block
    b575 - block
    b731 - block
    b851 - block
    b633 - block
    b618 - block
    b63 - block
    b305 - block
    b527 - block
    b252 - block
    b304 - block
    b658 - block
    b582 - block
    b279 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b9 b576 )
    ( on b661 b9 )
    ( on b48 b661 )
    ( on b771 b48 )
    ( on b349 b771 )
    ( on b204 b349 )
    ( on b431 b204 )
    ( on b834 b431 )
    ( on b44 b834 )
    ( on b836 b44 )
    ( on b575 b836 )
    ( on b731 b575 )
    ( on b851 b731 )
    ( on b633 b851 )
    ( on b618 b633 )
    ( on b63 b618 )
    ( on b305 b63 )
    ( on b527 b305 )
    ( on b252 b527 )
    ( on b304 b252 )
    ( on b658 b304 )
    ( on b582 b658 )
    ( on b279 b582 )
    ( on b2 b279 )
    ( clear b2 )
  )
  ( :goal
    ( and
      ( clear b576 )
    )
  )
)
