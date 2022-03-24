( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b872 - block
    b823 - block
    b230 - block
    b886 - block
    b741 - block
    b795 - block
    b148 - block
    b705 - block
    b341 - block
    b784 - block
    b36 - block
    b968 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b872 )
    ( on b823 b872 )
    ( on b230 b823 )
    ( on b886 b230 )
    ( on b741 b886 )
    ( on b795 b741 )
    ( on b148 b795 )
    ( on b705 b148 )
    ( on b341 b705 )
    ( on b784 b341 )
    ( on b36 b784 )
    ( on b968 b36 )
    ( clear b968 )
  )
  ( :tasks
    ( Make-11Pile b823 b230 b886 b741 b795 b148 b705 b341 b784 b36 b968 )
  )
)
