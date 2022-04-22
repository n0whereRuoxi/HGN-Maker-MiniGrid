( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b580 - block
    b522 - block
    b688 - block
    b848 - block
    b131 - block
    b362 - block
    b851 - block
    b686 - block
    b1 - block
    b368 - block
    b451 - block
    b589 - block
    b327 - block
    b861 - block
    b267 - block
    b174 - block
    b356 - block
    b443 - block
    b17 - block
    b903 - block
    b715 - block
    b525 - block
    b520 - block
    b149 - block
    b27 - block
    b916 - block
    b694 - block
    b402 - block
    b357 - block
    b899 - block
    b291 - block
    b513 - block
    b234 - block
    b371 - block
    b609 - block
    b690 - block
    b611 - block
    b538 - block
    b787 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b580 )
    ( on b522 b580 )
    ( on b688 b522 )
    ( on b848 b688 )
    ( on b131 b848 )
    ( on b362 b131 )
    ( on b851 b362 )
    ( on b686 b851 )
    ( on b1 b686 )
    ( on b368 b1 )
    ( on b451 b368 )
    ( on b589 b451 )
    ( on b327 b589 )
    ( on b861 b327 )
    ( on b267 b861 )
    ( on b174 b267 )
    ( on b356 b174 )
    ( on b443 b356 )
    ( on b17 b443 )
    ( on b903 b17 )
    ( on b715 b903 )
    ( on b525 b715 )
    ( on b520 b525 )
    ( on b149 b520 )
    ( on b27 b149 )
    ( on b916 b27 )
    ( on b694 b916 )
    ( on b402 b694 )
    ( on b357 b402 )
    ( on b899 b357 )
    ( on b291 b899 )
    ( on b513 b291 )
    ( on b234 b513 )
    ( on b371 b234 )
    ( on b609 b371 )
    ( on b690 b609 )
    ( on b611 b690 )
    ( on b538 b611 )
    ( on b787 b538 )
    ( on b452 b787 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b580 )
    )
  )
)
