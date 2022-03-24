( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b516 - block
    b861 - block
    b40 - block
    b877 - block
    b831 - block
    b473 - block
    b386 - block
    b760 - block
    b933 - block
    b846 - block
    b20 - block
    b844 - block
    b957 - block
    b709 - block
    b706 - block
    b362 - block
    b894 - block
    b820 - block
    b314 - block
    b735 - block
    b663 - block
    b817 - block
    b866 - block
    b724 - block
    b11 - block
    b495 - block
    b783 - block
    b258 - block
    b153 - block
    b705 - block
    b76 - block
    b326 - block
    b343 - block
    b870 - block
    b10 - block
    b886 - block
    b558 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b861 b516 )
    ( on b40 b861 )
    ( on b877 b40 )
    ( on b831 b877 )
    ( on b473 b831 )
    ( on b386 b473 )
    ( on b760 b386 )
    ( on b933 b760 )
    ( on b846 b933 )
    ( on b20 b846 )
    ( on b844 b20 )
    ( on b957 b844 )
    ( on b709 b957 )
    ( on b706 b709 )
    ( on b362 b706 )
    ( on b894 b362 )
    ( on b820 b894 )
    ( on b314 b820 )
    ( on b735 b314 )
    ( on b663 b735 )
    ( on b817 b663 )
    ( on b866 b817 )
    ( on b724 b866 )
    ( on b11 b724 )
    ( on b495 b11 )
    ( on b783 b495 )
    ( on b258 b783 )
    ( on b153 b258 )
    ( on b705 b153 )
    ( on b76 b705 )
    ( on b326 b76 )
    ( on b343 b326 )
    ( on b870 b343 )
    ( on b10 b870 )
    ( on b886 b10 )
    ( on b558 b886 )
    ( clear b558 )
  )
  ( :goal
    ( and
      ( clear b516 )
    )
  )
)
