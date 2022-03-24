( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b674 - block
    b79 - block
    b964 - block
    b308 - block
    b479 - block
    b651 - block
    b675 - block
    b431 - block
    b998 - block
    b804 - block
    b857 - block
    b844 - block
    b227 - block
    b217 - block
    b28 - block
    b15 - block
    b381 - block
    b196 - block
    b888 - block
    b401 - block
    b729 - block
    b538 - block
    b902 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b674 )
    ( on b79 b674 )
    ( on b964 b79 )
    ( on b308 b964 )
    ( on b479 b308 )
    ( on b651 b479 )
    ( on b675 b651 )
    ( on b431 b675 )
    ( on b998 b431 )
    ( on b804 b998 )
    ( on b857 b804 )
    ( on b844 b857 )
    ( on b227 b844 )
    ( on b217 b227 )
    ( on b28 b217 )
    ( on b15 b28 )
    ( on b381 b15 )
    ( on b196 b381 )
    ( on b888 b196 )
    ( on b401 b888 )
    ( on b729 b401 )
    ( on b538 b729 )
    ( on b902 b538 )
    ( clear b902 )
  )
  ( :goal
    ( and
      ( clear b674 )
    )
  )
)
