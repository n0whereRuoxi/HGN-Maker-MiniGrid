( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b167 - block
    b886 - block
    b402 - block
    b610 - block
    b208 - block
    b435 - block
    b386 - block
    b964 - block
    b660 - block
    b624 - block
    b861 - block
    b319 - block
    b685 - block
    b715 - block
    b308 - block
    b623 - block
    b361 - block
    b708 - block
    b300 - block
    b531 - block
    b643 - block
    b296 - block
    b486 - block
    b529 - block
    b795 - block
    b553 - block
    b550 - block
    b455 - block
    b707 - block
    b657 - block
    b466 - block
    b882 - block
    b297 - block
    b869 - block
    b891 - block
    b732 - block
    b87 - block
    b52 - block
    b10 - block
    b231 - block
    b709 - block
    b185 - block
    b931 - block
    b581 - block
    b131 - block
    b160 - block
    b157 - block
    b251 - block
    b782 - block
    b190 - block
    b29 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b167 )
    ( on b886 b167 )
    ( on b402 b886 )
    ( on b610 b402 )
    ( on b208 b610 )
    ( on b435 b208 )
    ( on b386 b435 )
    ( on b964 b386 )
    ( on b660 b964 )
    ( on b624 b660 )
    ( on b861 b624 )
    ( on b319 b861 )
    ( on b685 b319 )
    ( on b715 b685 )
    ( on b308 b715 )
    ( on b623 b308 )
    ( on b361 b623 )
    ( on b708 b361 )
    ( on b300 b708 )
    ( on b531 b300 )
    ( on b643 b531 )
    ( on b296 b643 )
    ( on b486 b296 )
    ( on b529 b486 )
    ( on b795 b529 )
    ( on b553 b795 )
    ( on b550 b553 )
    ( on b455 b550 )
    ( on b707 b455 )
    ( on b657 b707 )
    ( on b466 b657 )
    ( on b882 b466 )
    ( on b297 b882 )
    ( on b869 b297 )
    ( on b891 b869 )
    ( on b732 b891 )
    ( on b87 b732 )
    ( on b52 b87 )
    ( on b10 b52 )
    ( on b231 b10 )
    ( on b709 b231 )
    ( on b185 b709 )
    ( on b931 b185 )
    ( on b581 b931 )
    ( on b131 b581 )
    ( on b160 b131 )
    ( on b157 b160 )
    ( on b251 b157 )
    ( on b782 b251 )
    ( on b190 b782 )
    ( on b29 b190 )
    ( clear b29 )
  )
  ( :tasks
    ( Make-50Pile b886 b402 b610 b208 b435 b386 b964 b660 b624 b861 b319 b685 b715 b308 b623 b361 b708 b300 b531 b643 b296 b486 b529 b795 b553 b550 b455 b707 b657 b466 b882 b297 b869 b891 b732 b87 b52 b10 b231 b709 b185 b931 b581 b131 b160 b157 b251 b782 b190 b29 )
  )
)
