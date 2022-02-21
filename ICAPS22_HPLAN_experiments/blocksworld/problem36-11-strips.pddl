( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b556 - block
    b656 - block
    b86 - block
    b677 - block
    b279 - block
    b859 - block
    b497 - block
    b480 - block
    b337 - block
    b471 - block
    b861 - block
    b554 - block
    b403 - block
    b358 - block
    b618 - block
    b296 - block
    b724 - block
    b655 - block
    b456 - block
    b664 - block
    b378 - block
    b776 - block
    b227 - block
    b229 - block
    b3 - block
    b987 - block
    b366 - block
    b210 - block
    b391 - block
    b792 - block
    b605 - block
    b399 - block
    b942 - block
    b598 - block
    b225 - block
    b332 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b556 b735 )
    ( on b656 b556 )
    ( on b86 b656 )
    ( on b677 b86 )
    ( on b279 b677 )
    ( on b859 b279 )
    ( on b497 b859 )
    ( on b480 b497 )
    ( on b337 b480 )
    ( on b471 b337 )
    ( on b861 b471 )
    ( on b554 b861 )
    ( on b403 b554 )
    ( on b358 b403 )
    ( on b618 b358 )
    ( on b296 b618 )
    ( on b724 b296 )
    ( on b655 b724 )
    ( on b456 b655 )
    ( on b664 b456 )
    ( on b378 b664 )
    ( on b776 b378 )
    ( on b227 b776 )
    ( on b229 b227 )
    ( on b3 b229 )
    ( on b987 b3 )
    ( on b366 b987 )
    ( on b210 b366 )
    ( on b391 b210 )
    ( on b792 b391 )
    ( on b605 b792 )
    ( on b399 b605 )
    ( on b942 b399 )
    ( on b598 b942 )
    ( on b225 b598 )
    ( on b332 b225 )
    ( clear b332 )
  )
  ( :goal
    ( and
      ( clear b735 )
    )
  )
)
