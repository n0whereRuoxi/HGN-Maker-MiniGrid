( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b494 - block
    b480 - block
    b523 - block
    b477 - block
    b989 - block
    b11 - block
    b923 - block
    b130 - block
    b563 - block
    b486 - block
    b623 - block
    b439 - block
    b879 - block
    b768 - block
    b934 - block
    b174 - block
    b894 - block
    b186 - block
    b447 - block
    b254 - block
    b641 - block
    b175 - block
    b514 - block
    b852 - block
    b546 - block
    b115 - block
    b618 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b494 )
    ( on b480 b494 )
    ( on b523 b480 )
    ( on b477 b523 )
    ( on b989 b477 )
    ( on b11 b989 )
    ( on b923 b11 )
    ( on b130 b923 )
    ( on b563 b130 )
    ( on b486 b563 )
    ( on b623 b486 )
    ( on b439 b623 )
    ( on b879 b439 )
    ( on b768 b879 )
    ( on b934 b768 )
    ( on b174 b934 )
    ( on b894 b174 )
    ( on b186 b894 )
    ( on b447 b186 )
    ( on b254 b447 )
    ( on b641 b254 )
    ( on b175 b641 )
    ( on b514 b175 )
    ( on b852 b514 )
    ( on b546 b852 )
    ( on b115 b546 )
    ( on b618 b115 )
    ( on b440 b618 )
    ( clear b440 )
  )
  ( :goal
    ( and
      ( clear b494 )
    )
  )
)
