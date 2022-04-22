( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b283 - block
    b844 - block
    b805 - block
    b10 - block
    b128 - block
    b141 - block
    b618 - block
    b646 - block
    b270 - block
    b599 - block
    b302 - block
    b555 - block
    b104 - block
    b531 - block
    b660 - block
    b874 - block
    b994 - block
    b36 - block
    b768 - block
    b969 - block
    b180 - block
    b347 - block
    b417 - block
    b835 - block
    b912 - block
    b362 - block
    b315 - block
    b573 - block
    b563 - block
    b259 - block
    b132 - block
    b931 - block
    b146 - block
    b304 - block
    b614 - block
    b756 - block
    b750 - block
    b669 - block
    b448 - block
    b987 - block
    b474 - block
    b430 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b283 )
    ( on b844 b283 )
    ( on b805 b844 )
    ( on b10 b805 )
    ( on b128 b10 )
    ( on b141 b128 )
    ( on b618 b141 )
    ( on b646 b618 )
    ( on b270 b646 )
    ( on b599 b270 )
    ( on b302 b599 )
    ( on b555 b302 )
    ( on b104 b555 )
    ( on b531 b104 )
    ( on b660 b531 )
    ( on b874 b660 )
    ( on b994 b874 )
    ( on b36 b994 )
    ( on b768 b36 )
    ( on b969 b768 )
    ( on b180 b969 )
    ( on b347 b180 )
    ( on b417 b347 )
    ( on b835 b417 )
    ( on b912 b835 )
    ( on b362 b912 )
    ( on b315 b362 )
    ( on b573 b315 )
    ( on b563 b573 )
    ( on b259 b563 )
    ( on b132 b259 )
    ( on b931 b132 )
    ( on b146 b931 )
    ( on b304 b146 )
    ( on b614 b304 )
    ( on b756 b614 )
    ( on b750 b756 )
    ( on b669 b750 )
    ( on b448 b669 )
    ( on b987 b448 )
    ( on b474 b987 )
    ( on b430 b474 )
    ( clear b430 )
  )
  ( :goal
    ( and
      ( clear b283 )
    )
  )
)
