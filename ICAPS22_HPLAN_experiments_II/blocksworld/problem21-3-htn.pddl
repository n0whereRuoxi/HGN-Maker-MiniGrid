( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b58 - block
    b372 - block
    b556 - block
    b548 - block
    b218 - block
    b718 - block
    b987 - block
    b396 - block
    b782 - block
    b614 - block
    b109 - block
    b962 - block
    b970 - block
    b626 - block
    b621 - block
    b984 - block
    b872 - block
    b688 - block
    b364 - block
    b242 - block
    b776 - block
    b719 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b58 )
    ( on b372 b58 )
    ( on b556 b372 )
    ( on b548 b556 )
    ( on b218 b548 )
    ( on b718 b218 )
    ( on b987 b718 )
    ( on b396 b987 )
    ( on b782 b396 )
    ( on b614 b782 )
    ( on b109 b614 )
    ( on b962 b109 )
    ( on b970 b962 )
    ( on b626 b970 )
    ( on b621 b626 )
    ( on b984 b621 )
    ( on b872 b984 )
    ( on b688 b872 )
    ( on b364 b688 )
    ( on b242 b364 )
    ( on b776 b242 )
    ( on b719 b776 )
    ( clear b719 )
  )
  ( :tasks
    ( Make-21Pile b372 b556 b548 b218 b718 b987 b396 b782 b614 b109 b962 b970 b626 b621 b984 b872 b688 b364 b242 b776 b719 )
  )
)
