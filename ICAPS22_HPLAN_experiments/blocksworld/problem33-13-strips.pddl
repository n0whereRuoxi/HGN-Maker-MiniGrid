( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b805 - block
    b697 - block
    b880 - block
    b665 - block
    b573 - block
    b145 - block
    b701 - block
    b764 - block
    b12 - block
    b845 - block
    b351 - block
    b820 - block
    b102 - block
    b316 - block
    b42 - block
    b480 - block
    b767 - block
    b63 - block
    b657 - block
    b215 - block
    b983 - block
    b771 - block
    b515 - block
    b423 - block
    b676 - block
    b249 - block
    b411 - block
    b546 - block
    b951 - block
    b509 - block
    b82 - block
    b507 - block
    b426 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b805 b871 )
    ( on b697 b805 )
    ( on b880 b697 )
    ( on b665 b880 )
    ( on b573 b665 )
    ( on b145 b573 )
    ( on b701 b145 )
    ( on b764 b701 )
    ( on b12 b764 )
    ( on b845 b12 )
    ( on b351 b845 )
    ( on b820 b351 )
    ( on b102 b820 )
    ( on b316 b102 )
    ( on b42 b316 )
    ( on b480 b42 )
    ( on b767 b480 )
    ( on b63 b767 )
    ( on b657 b63 )
    ( on b215 b657 )
    ( on b983 b215 )
    ( on b771 b983 )
    ( on b515 b771 )
    ( on b423 b515 )
    ( on b676 b423 )
    ( on b249 b676 )
    ( on b411 b249 )
    ( on b546 b411 )
    ( on b951 b546 )
    ( on b509 b951 )
    ( on b82 b509 )
    ( on b507 b82 )
    ( on b426 b507 )
    ( clear b426 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
