( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b928 - block
    b280 - block
    b440 - block
    b502 - block
    b552 - block
    b631 - block
    b43 - block
    b666 - block
    b191 - block
    b292 - block
    b677 - block
    b929 - block
    b969 - block
    b527 - block
    b290 - block
    b550 - block
    b442 - block
    b615 - block
    b374 - block
    b987 - block
    b618 - block
    b356 - block
    b888 - block
    b768 - block
    b709 - block
    b513 - block
    b838 - block
    b712 - block
    b180 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b928 b874 )
    ( on b280 b928 )
    ( on b440 b280 )
    ( on b502 b440 )
    ( on b552 b502 )
    ( on b631 b552 )
    ( on b43 b631 )
    ( on b666 b43 )
    ( on b191 b666 )
    ( on b292 b191 )
    ( on b677 b292 )
    ( on b929 b677 )
    ( on b969 b929 )
    ( on b527 b969 )
    ( on b290 b527 )
    ( on b550 b290 )
    ( on b442 b550 )
    ( on b615 b442 )
    ( on b374 b615 )
    ( on b987 b374 )
    ( on b618 b987 )
    ( on b356 b618 )
    ( on b888 b356 )
    ( on b768 b888 )
    ( on b709 b768 )
    ( on b513 b709 )
    ( on b838 b513 )
    ( on b712 b838 )
    ( on b180 b712 )
    ( on b806 b180 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)
