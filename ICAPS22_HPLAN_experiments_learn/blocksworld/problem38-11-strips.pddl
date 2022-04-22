( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b989 - block
    b191 - block
    b849 - block
    b329 - block
    b519 - block
    b313 - block
    b215 - block
    b218 - block
    b550 - block
    b533 - block
    b155 - block
    b602 - block
    b946 - block
    b839 - block
    b394 - block
    b741 - block
    b132 - block
    b477 - block
    b9 - block
    b414 - block
    b145 - block
    b784 - block
    b20 - block
    b453 - block
    b281 - block
    b737 - block
    b268 - block
    b577 - block
    b216 - block
    b961 - block
    b558 - block
    b249 - block
    b115 - block
    b897 - block
    b75 - block
    b236 - block
    b596 - block
    b607 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b989 )
    ( on b191 b989 )
    ( on b849 b191 )
    ( on b329 b849 )
    ( on b519 b329 )
    ( on b313 b519 )
    ( on b215 b313 )
    ( on b218 b215 )
    ( on b550 b218 )
    ( on b533 b550 )
    ( on b155 b533 )
    ( on b602 b155 )
    ( on b946 b602 )
    ( on b839 b946 )
    ( on b394 b839 )
    ( on b741 b394 )
    ( on b132 b741 )
    ( on b477 b132 )
    ( on b9 b477 )
    ( on b414 b9 )
    ( on b145 b414 )
    ( on b784 b145 )
    ( on b20 b784 )
    ( on b453 b20 )
    ( on b281 b453 )
    ( on b737 b281 )
    ( on b268 b737 )
    ( on b577 b268 )
    ( on b216 b577 )
    ( on b961 b216 )
    ( on b558 b961 )
    ( on b249 b558 )
    ( on b115 b249 )
    ( on b897 b115 )
    ( on b75 b897 )
    ( on b236 b75 )
    ( on b596 b236 )
    ( on b607 b596 )
    ( on b341 b607 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b989 )
    )
  )
)
