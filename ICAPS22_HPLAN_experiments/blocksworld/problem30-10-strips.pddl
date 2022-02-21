( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b946 - block
    b200 - block
    b493 - block
    b5 - block
    b85 - block
    b195 - block
    b679 - block
    b149 - block
    b855 - block
    b506 - block
    b548 - block
    b419 - block
    b675 - block
    b959 - block
    b213 - block
    b10 - block
    b480 - block
    b524 - block
    b547 - block
    b400 - block
    b328 - block
    b202 - block
    b117 - block
    b818 - block
    b942 - block
    b56 - block
    b459 - block
    b528 - block
    b625 - block
    b878 - block
    b106 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b200 b946 )
    ( on b493 b200 )
    ( on b5 b493 )
    ( on b85 b5 )
    ( on b195 b85 )
    ( on b679 b195 )
    ( on b149 b679 )
    ( on b855 b149 )
    ( on b506 b855 )
    ( on b548 b506 )
    ( on b419 b548 )
    ( on b675 b419 )
    ( on b959 b675 )
    ( on b213 b959 )
    ( on b10 b213 )
    ( on b480 b10 )
    ( on b524 b480 )
    ( on b547 b524 )
    ( on b400 b547 )
    ( on b328 b400 )
    ( on b202 b328 )
    ( on b117 b202 )
    ( on b818 b117 )
    ( on b942 b818 )
    ( on b56 b942 )
    ( on b459 b56 )
    ( on b528 b459 )
    ( on b625 b528 )
    ( on b878 b625 )
    ( on b106 b878 )
    ( clear b106 )
  )
  ( :goal
    ( and
      ( clear b946 )
    )
  )
)
