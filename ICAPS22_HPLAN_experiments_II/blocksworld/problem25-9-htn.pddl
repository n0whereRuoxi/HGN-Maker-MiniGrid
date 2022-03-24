( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b611 - block
    b781 - block
    b304 - block
    b426 - block
    b589 - block
    b146 - block
    b795 - block
    b305 - block
    b387 - block
    b789 - block
    b331 - block
    b993 - block
    b184 - block
    b949 - block
    b55 - block
    b43 - block
    b671 - block
    b720 - block
    b902 - block
    b126 - block
    b101 - block
    b660 - block
    b8 - block
    b700 - block
    b196 - block
    b968 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b611 )
    ( on b781 b611 )
    ( on b304 b781 )
    ( on b426 b304 )
    ( on b589 b426 )
    ( on b146 b589 )
    ( on b795 b146 )
    ( on b305 b795 )
    ( on b387 b305 )
    ( on b789 b387 )
    ( on b331 b789 )
    ( on b993 b331 )
    ( on b184 b993 )
    ( on b949 b184 )
    ( on b55 b949 )
    ( on b43 b55 )
    ( on b671 b43 )
    ( on b720 b671 )
    ( on b902 b720 )
    ( on b126 b902 )
    ( on b101 b126 )
    ( on b660 b101 )
    ( on b8 b660 )
    ( on b700 b8 )
    ( on b196 b700 )
    ( on b968 b196 )
    ( clear b968 )
  )
  ( :tasks
    ( Make-25Pile b781 b304 b426 b589 b146 b795 b305 b387 b789 b331 b993 b184 b949 b55 b43 b671 b720 b902 b126 b101 b660 b8 b700 b196 b968 )
  )
)
