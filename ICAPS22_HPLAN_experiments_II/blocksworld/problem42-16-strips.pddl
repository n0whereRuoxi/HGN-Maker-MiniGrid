( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b704 - block
    b907 - block
    b633 - block
    b604 - block
    b853 - block
    b274 - block
    b389 - block
    b896 - block
    b635 - block
    b10 - block
    b857 - block
    b977 - block
    b7 - block
    b984 - block
    b966 - block
    b956 - block
    b137 - block
    b647 - block
    b27 - block
    b143 - block
    b333 - block
    b484 - block
    b592 - block
    b703 - block
    b811 - block
    b756 - block
    b698 - block
    b801 - block
    b814 - block
    b613 - block
    b329 - block
    b272 - block
    b589 - block
    b153 - block
    b345 - block
    b229 - block
    b247 - block
    b42 - block
    b237 - block
    b974 - block
    b480 - block
    b452 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b704 )
    ( on b907 b704 )
    ( on b633 b907 )
    ( on b604 b633 )
    ( on b853 b604 )
    ( on b274 b853 )
    ( on b389 b274 )
    ( on b896 b389 )
    ( on b635 b896 )
    ( on b10 b635 )
    ( on b857 b10 )
    ( on b977 b857 )
    ( on b7 b977 )
    ( on b984 b7 )
    ( on b966 b984 )
    ( on b956 b966 )
    ( on b137 b956 )
    ( on b647 b137 )
    ( on b27 b647 )
    ( on b143 b27 )
    ( on b333 b143 )
    ( on b484 b333 )
    ( on b592 b484 )
    ( on b703 b592 )
    ( on b811 b703 )
    ( on b756 b811 )
    ( on b698 b756 )
    ( on b801 b698 )
    ( on b814 b801 )
    ( on b613 b814 )
    ( on b329 b613 )
    ( on b272 b329 )
    ( on b589 b272 )
    ( on b153 b589 )
    ( on b345 b153 )
    ( on b229 b345 )
    ( on b247 b229 )
    ( on b42 b247 )
    ( on b237 b42 )
    ( on b974 b237 )
    ( on b480 b974 )
    ( on b452 b480 )
    ( on b213 b452 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b704 )
    )
  )
)
