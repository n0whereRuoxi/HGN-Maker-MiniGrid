( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b851 - block
    b114 - block
    b329 - block
    b163 - block
    b934 - block
    b475 - block
    b539 - block
    b828 - block
    b182 - block
    b505 - block
    b318 - block
    b110 - block
    b21 - block
    b754 - block
    b737 - block
    b747 - block
    b713 - block
    b387 - block
    b321 - block
    b857 - block
    b439 - block
    b533 - block
    b281 - block
    b969 - block
    b120 - block
    b953 - block
    b508 - block
    b401 - block
    b445 - block
    b398 - block
    b835 - block
    b926 - block
    b106 - block
    b497 - block
    b774 - block
    b639 - block
    b324 - block
    b939 - block
    b987 - block
    b929 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b114 b851 )
    ( on b329 b114 )
    ( on b163 b329 )
    ( on b934 b163 )
    ( on b475 b934 )
    ( on b539 b475 )
    ( on b828 b539 )
    ( on b182 b828 )
    ( on b505 b182 )
    ( on b318 b505 )
    ( on b110 b318 )
    ( on b21 b110 )
    ( on b754 b21 )
    ( on b737 b754 )
    ( on b747 b737 )
    ( on b713 b747 )
    ( on b387 b713 )
    ( on b321 b387 )
    ( on b857 b321 )
    ( on b439 b857 )
    ( on b533 b439 )
    ( on b281 b533 )
    ( on b969 b281 )
    ( on b120 b969 )
    ( on b953 b120 )
    ( on b508 b953 )
    ( on b401 b508 )
    ( on b445 b401 )
    ( on b398 b445 )
    ( on b835 b398 )
    ( on b926 b835 )
    ( on b106 b926 )
    ( on b497 b106 )
    ( on b774 b497 )
    ( on b639 b774 )
    ( on b324 b639 )
    ( on b939 b324 )
    ( on b987 b939 )
    ( on b929 b987 )
    ( clear b929 )
  )
  ( :goal
    ( and
      ( clear b851 )
    )
  )
)
