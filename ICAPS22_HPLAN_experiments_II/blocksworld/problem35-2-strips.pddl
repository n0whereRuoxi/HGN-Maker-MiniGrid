( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b945 - block
    b22 - block
    b400 - block
    b769 - block
    b127 - block
    b507 - block
    b653 - block
    b671 - block
    b760 - block
    b766 - block
    b630 - block
    b618 - block
    b549 - block
    b500 - block
    b234 - block
    b968 - block
    b812 - block
    b509 - block
    b404 - block
    b52 - block
    b143 - block
    b734 - block
    b85 - block
    b493 - block
    b298 - block
    b780 - block
    b820 - block
    b430 - block
    b485 - block
    b45 - block
    b464 - block
    b330 - block
    b989 - block
    b869 - block
    b153 - block
    b804 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b945 )
    ( on b22 b945 )
    ( on b400 b22 )
    ( on b769 b400 )
    ( on b127 b769 )
    ( on b507 b127 )
    ( on b653 b507 )
    ( on b671 b653 )
    ( on b760 b671 )
    ( on b766 b760 )
    ( on b630 b766 )
    ( on b618 b630 )
    ( on b549 b618 )
    ( on b500 b549 )
    ( on b234 b500 )
    ( on b968 b234 )
    ( on b812 b968 )
    ( on b509 b812 )
    ( on b404 b509 )
    ( on b52 b404 )
    ( on b143 b52 )
    ( on b734 b143 )
    ( on b85 b734 )
    ( on b493 b85 )
    ( on b298 b493 )
    ( on b780 b298 )
    ( on b820 b780 )
    ( on b430 b820 )
    ( on b485 b430 )
    ( on b45 b485 )
    ( on b464 b45 )
    ( on b330 b464 )
    ( on b989 b330 )
    ( on b869 b989 )
    ( on b153 b869 )
    ( on b804 b153 )
    ( clear b804 )
  )
  ( :goal
    ( and
      ( clear b945 )
    )
  )
)
