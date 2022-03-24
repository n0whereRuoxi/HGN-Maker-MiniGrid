( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b632 - block
    b883 - block
    b691 - block
    b552 - block
    b694 - block
    b583 - block
    b995 - block
    b408 - block
    b60 - block
    b437 - block
    b434 - block
    b763 - block
    b593 - block
    b230 - block
    b358 - block
    b395 - block
    b191 - block
    b486 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b632 b772 )
    ( on b883 b632 )
    ( on b691 b883 )
    ( on b552 b691 )
    ( on b694 b552 )
    ( on b583 b694 )
    ( on b995 b583 )
    ( on b408 b995 )
    ( on b60 b408 )
    ( on b437 b60 )
    ( on b434 b437 )
    ( on b763 b434 )
    ( on b593 b763 )
    ( on b230 b593 )
    ( on b358 b230 )
    ( on b395 b358 )
    ( on b191 b395 )
    ( on b486 b191 )
    ( on b502 b486 )
    ( clear b502 )
  )
  ( :tasks
    ( Make-19Pile b632 b883 b691 b552 b694 b583 b995 b408 b60 b437 b434 b763 b593 b230 b358 b395 b191 b486 b502 )
  )
)
