( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b901 - block
    b234 - block
    b219 - block
    b742 - block
    b527 - block
    b278 - block
    b112 - block
    b154 - block
    b122 - block
    b554 - block
    b819 - block
    b271 - block
    b415 - block
    b751 - block
    b818 - block
    b229 - block
    b997 - block
    b826 - block
    b466 - block
    b444 - block
    b224 - block
    b296 - block
    b955 - block
    b619 - block
    b502 - block
    b145 - block
    b651 - block
    b393 - block
    b212 - block
    b166 - block
    b2 - block
    b784 - block
    b377 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b234 b901 )
    ( on b219 b234 )
    ( on b742 b219 )
    ( on b527 b742 )
    ( on b278 b527 )
    ( on b112 b278 )
    ( on b154 b112 )
    ( on b122 b154 )
    ( on b554 b122 )
    ( on b819 b554 )
    ( on b271 b819 )
    ( on b415 b271 )
    ( on b751 b415 )
    ( on b818 b751 )
    ( on b229 b818 )
    ( on b997 b229 )
    ( on b826 b997 )
    ( on b466 b826 )
    ( on b444 b466 )
    ( on b224 b444 )
    ( on b296 b224 )
    ( on b955 b296 )
    ( on b619 b955 )
    ( on b502 b619 )
    ( on b145 b502 )
    ( on b651 b145 )
    ( on b393 b651 )
    ( on b212 b393 )
    ( on b166 b212 )
    ( on b2 b166 )
    ( on b784 b2 )
    ( on b377 b784 )
    ( clear b377 )
  )
  ( :goal
    ( and
      ( clear b901 )
    )
  )
)
