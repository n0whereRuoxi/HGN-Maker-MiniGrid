( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b141 - block
    b700 - block
    b7 - block
    b433 - block
    b82 - block
    b161 - block
    b120 - block
    b393 - block
    b463 - block
    b842 - block
    b407 - block
    b442 - block
    b74 - block
    b678 - block
    b315 - block
    b239 - block
    b36 - block
    b447 - block
    b292 - block
    b943 - block
    b873 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b141 )
    ( on b700 b141 )
    ( on b7 b700 )
    ( on b433 b7 )
    ( on b82 b433 )
    ( on b161 b82 )
    ( on b120 b161 )
    ( on b393 b120 )
    ( on b463 b393 )
    ( on b842 b463 )
    ( on b407 b842 )
    ( on b442 b407 )
    ( on b74 b442 )
    ( on b678 b74 )
    ( on b315 b678 )
    ( on b239 b315 )
    ( on b36 b239 )
    ( on b447 b36 )
    ( on b292 b447 )
    ( on b943 b292 )
    ( on b873 b943 )
    ( clear b873 )
  )
  ( :tasks
    ( Make-20Pile b700 b7 b433 b82 b161 b120 b393 b463 b842 b407 b442 b74 b678 b315 b239 b36 b447 b292 b943 b873 )
  )
)
