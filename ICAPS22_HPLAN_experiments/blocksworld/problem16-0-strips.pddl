( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b694 - block
    b719 - block
    b149 - block
    b669 - block
    b153 - block
    b834 - block
    b837 - block
    b776 - block
    b251 - block
    b495 - block
    b824 - block
    b798 - block
    b677 - block
    b443 - block
    b150 - block
    b727 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b694 )
    ( on b719 b694 )
    ( on b149 b719 )
    ( on b669 b149 )
    ( on b153 b669 )
    ( on b834 b153 )
    ( on b837 b834 )
    ( on b776 b837 )
    ( on b251 b776 )
    ( on b495 b251 )
    ( on b824 b495 )
    ( on b798 b824 )
    ( on b677 b798 )
    ( on b443 b677 )
    ( on b150 b443 )
    ( on b727 b150 )
    ( on b414 b727 )
    ( clear b414 )
  )
  ( :goal
    ( and
      ( clear b694 )
    )
  )
)
