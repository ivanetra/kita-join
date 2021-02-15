<?php

namespace App\Http\Controllers;

use App\profile;
use App\User;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ProfilesController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth','verified']);
    }
    
    public function index()
    {
        $profiles = Profile::all()->toArray();
        return array_reverse($profiles);
    }



    public function profile($id)
    {
        $profile = Profile::find($id);
        if ($profile->contact === 'Empty') {
            $profile->contact = '';
        }
        if ($profile->interest === 'Empty') {
            $profile->interest = '';
        }
        return response()->json($profile);
    }

    public function edit(Request $request,Profile $id)
    {
        //
    }

    public function update(Request $request,$id)
    {
        $profile = Profile::find($id);
        $data = request()->validate([
            'image' => '',
            'bio' => '',
            'contact' => 'required',
            'interest' => 'required'
        ]);

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time().'.'.$extension;
            $file->move('storage/profile', $filename);
            $exactPath = "/storage/profile/";
            $exactPath = $exactPath . $filename;
            $imageArray = ['image'=> $exactPath ];
        }
        
        $profile->update(array_merge(
            $data,
            $imageArray ?? []
        ));
        
        return response()->json('The profile successfully updated');
    }
}
