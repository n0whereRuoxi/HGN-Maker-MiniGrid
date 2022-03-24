( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b47 - block
    b827 - block
    b217 - block
    b263 - block
    b650 - block
    b948 - block
    b624 - block
    b607 - block
    b857 - block
    b415 - block
    b754 - block
    b580 - block
    b298 - block
    b494 - block
    b664 - block
    b306 - block
    b37 - block
    b76 - block
    b590 - block
    b617 - block
    b495 - block
    b506 - block
    b985 - block
    b182 - block
    b938 - block
    b573 - block
    b943 - block
    b459 - block
    b74 - block
    b42 - block
    b761 - block
    b574 - block
    b55 - block
    b87 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b47 )
    ( on b827 b47 )
    ( on b217 b827 )
    ( on b263 b217 )
    ( on b650 b263 )
    ( on b948 b650 )
    ( on b624 b948 )
    ( on b607 b624 )
    ( on b857 b607 )
    ( on b415 b857 )
    ( on b754 b415 )
    ( on b580 b754 )
    ( on b298 b580 )
    ( on b494 b298 )
    ( on b664 b494 )
    ( on b306 b664 )
    ( on b37 b306 )
    ( on b76 b37 )
    ( on b590 b76 )
    ( on b617 b590 )
    ( on b495 b617 )
    ( on b506 b495 )
    ( on b985 b506 )
    ( on b182 b985 )
    ( on b938 b182 )
    ( on b573 b938 )
    ( on b943 b573 )
    ( on b459 b943 )
    ( on b74 b459 )
    ( on b42 b74 )
    ( on b761 b42 )
    ( on b574 b761 )
    ( on b55 b574 )
    ( on b87 b55 )
    ( clear b87 )
  )
  ( :tasks
    ( Make-33Pile b827 b217 b263 b650 b948 b624 b607 b857 b415 b754 b580 b298 b494 b664 b306 b37 b76 b590 b617 b495 b506 b985 b182 b938 b573 b943 b459 b74 b42 b761 b574 b55 b87 )
  )
)
