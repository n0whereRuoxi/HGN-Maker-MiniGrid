( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b487 - block
    b988 - block
    b521 - block
    b606 - block
    b999 - block
    b67 - block
    b28 - block
    b425 - block
    b125 - block
    b902 - block
    b883 - block
    b761 - block
    b582 - block
    b117 - block
    b420 - block
    b727 - block
    b893 - block
    b410 - block
    b338 - block
    b642 - block
    b539 - block
    b121 - block
    b10 - block
    b543 - block
    b505 - block
    b287 - block
    b708 - block
    b776 - block
    b216 - block
    b108 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b487 b618 )
    ( on b988 b487 )
    ( on b521 b988 )
    ( on b606 b521 )
    ( on b999 b606 )
    ( on b67 b999 )
    ( on b28 b67 )
    ( on b425 b28 )
    ( on b125 b425 )
    ( on b902 b125 )
    ( on b883 b902 )
    ( on b761 b883 )
    ( on b582 b761 )
    ( on b117 b582 )
    ( on b420 b117 )
    ( on b727 b420 )
    ( on b893 b727 )
    ( on b410 b893 )
    ( on b338 b410 )
    ( on b642 b338 )
    ( on b539 b642 )
    ( on b121 b539 )
    ( on b10 b121 )
    ( on b543 b10 )
    ( on b505 b543 )
    ( on b287 b505 )
    ( on b708 b287 )
    ( on b776 b708 )
    ( on b216 b776 )
    ( on b108 b216 )
    ( clear b108 )
  )
  ( :goal
    ( and
      ( clear b618 )
    )
  )
)
