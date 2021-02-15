<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'interest','department','program',
        'semester','ept','ip','contact',
        'experience','desc','bio','image',
    ];
    
    public function profileImage()
    {
        $imagePath =($this->image) ? $this->image : 'profile/3yAG2cibKtTi1xlhftjcPaPZpfSxdFFpE2BY4tA2.png';

        return  '/storage/'. $imagePath;
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
