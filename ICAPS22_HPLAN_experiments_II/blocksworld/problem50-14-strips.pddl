( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b747 - block
    b603 - block
    b758 - block
    b188 - block
    b354 - block
    b744 - block
    b87 - block
    b242 - block
    b72 - block
    b991 - block
    b860 - block
    b970 - block
    b850 - block
    b604 - block
    b455 - block
    b167 - block
    b423 - block
    b73 - block
    b770 - block
    b684 - block
    b98 - block
    b763 - block
    b1 - block
    b997 - block
    b840 - block
    b849 - block
    b259 - block
    b275 - block
    b130 - block
    b411 - block
    b844 - block
    b272 - block
    b911 - block
    b142 - block
    b696 - block
    b183 - block
    b725 - block
    b201 - block
    b715 - block
    b456 - block
    b651 - block
    b646 - block
    b430 - block
    b627 - block
    b52 - block
    b375 - block
    b871 - block
    b880 - block
    b229 - block
    b818 - block
    b759 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b747 )
    ( on b603 b747 )
    ( on b758 b603 )
    ( on b188 b758 )
    ( on b354 b188 )
    ( on b744 b354 )
    ( on b87 b744 )
    ( on b242 b87 )
    ( on b72 b242 )
    ( on b991 b72 )
    ( on b860 b991 )
    ( on b970 b860 )
    ( on b850 b970 )
    ( on b604 b850 )
    ( on b455 b604 )
    ( on b167 b455 )
    ( on b423 b167 )
    ( on b73 b423 )
    ( on b770 b73 )
    ( on b684 b770 )
    ( on b98 b684 )
    ( on b763 b98 )
    ( on b1 b763 )
    ( on b997 b1 )
    ( on b840 b997 )
    ( on b849 b840 )
    ( on b259 b849 )
    ( on b275 b259 )
    ( on b130 b275 )
    ( on b411 b130 )
    ( on b844 b411 )
    ( on b272 b844 )
    ( on b911 b272 )
    ( on b142 b911 )
    ( on b696 b142 )
    ( on b183 b696 )
    ( on b725 b183 )
    ( on b201 b725 )
    ( on b715 b201 )
    ( on b456 b715 )
    ( on b651 b456 )
    ( on b646 b651 )
    ( on b430 b646 )
    ( on b627 b430 )
    ( on b52 b627 )
    ( on b375 b52 )
    ( on b871 b375 )
    ( on b880 b871 )
    ( on b229 b880 )
    ( on b818 b229 )
    ( on b759 b818 )
    ( clear b759 )
  )
  ( :goal
    ( and
      ( clear b747 )
    )
  )
)
