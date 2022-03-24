( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b680 - block
    b569 - block
    b558 - block
    b718 - block
    b91 - block
    b69 - block
    b759 - block
    b715 - block
    b696 - block
    b381 - block
    b728 - block
    b840 - block
    b355 - block
    b956 - block
    b645 - block
    b345 - block
    b536 - block
    b415 - block
    b810 - block
    b350 - block
    b151 - block
    b635 - block
    b249 - block
    b264 - block
    b472 - block
    b233 - block
    b872 - block
    b527 - block
    b131 - block
    b18 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b680 )
    ( on b569 b680 )
    ( on b558 b569 )
    ( on b718 b558 )
    ( on b91 b718 )
    ( on b69 b91 )
    ( on b759 b69 )
    ( on b715 b759 )
    ( on b696 b715 )
    ( on b381 b696 )
    ( on b728 b381 )
    ( on b840 b728 )
    ( on b355 b840 )
    ( on b956 b355 )
    ( on b645 b956 )
    ( on b345 b645 )
    ( on b536 b345 )
    ( on b415 b536 )
    ( on b810 b415 )
    ( on b350 b810 )
    ( on b151 b350 )
    ( on b635 b151 )
    ( on b249 b635 )
    ( on b264 b249 )
    ( on b472 b264 )
    ( on b233 b472 )
    ( on b872 b233 )
    ( on b527 b872 )
    ( on b131 b527 )
    ( on b18 b131 )
    ( on b487 b18 )
    ( clear b487 )
  )
  ( :tasks
    ( Make-30Pile b569 b558 b718 b91 b69 b759 b715 b696 b381 b728 b840 b355 b956 b645 b345 b536 b415 b810 b350 b151 b635 b249 b264 b472 b233 b872 b527 b131 b18 b487 )
  )
)
